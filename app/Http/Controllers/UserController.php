<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Hash;
class UserController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware(['auth','statusCheck']);
    }
    public function index()
    {
        $users = User::allusers()->get();
        return view('user.index',compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $permissions = Permission::all();
        return view('user.create',compact('permissions'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
           'name'=>['required'],
           'email'=>['required','unique:users'],
           'password'=>['required','min:6','confirmed'],
           'profile_picture'=>['required','image'],
           'gender'=>['required'],
           'status'=>['required']
        ]);
        //Storing Image to local disk
        $extension = $request->file('profile_picture')->getClientOriginalExtension();
        $completeFileName = str_replace(" ","_",strtolower($request->input('name'))).".".$extension;
        $path = $request->file('profile_picture')->storeAs('/user/profile',$completeFileName);

        $user = User::create([
           'name'=>$request->input('name'),
           'email'=>$request->input('email'),
           'password'=> Hash::make($request->input('password')),
           'profile_picture' =>$path,
           'gender'=> $request->input('gender'),
           'status'=> $request->input('status')
        ]);
        session()->flash('success','User Created Successfully');
        return redirect()->route('users.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $permissions = Permission::all();
        $user = User::find($id);
        $currentPermissions = $user->getAllPermissions()->pluck('id')->toArray();
        return view('user.show',compact('user','permissions','currentPermissions'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $permissions = Permission::all();
        $user = User::find($id);
        $currentPermissions = $user->getAllPermissions()->pluck('id')->toArray();
        return view('user.edit',compact('user','permissions','currentPermissions'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $request->validate([
            'name'=>['required'],
            'gender'=>['required'],
            'status'=>['required'],
        ]);
        $user->update([
           'name'=>$request->input('name'),
           'gender'=> $request->input('gender'),
           'status'=> $request->input('status')
        ]);

        if($request->hasFile('profile_picture'))
        {
            //Storing Image to local disk
            $extension = $request->file('profile_picture')->getClientOriginalExtension();
            $completeFileName = str_replace(" ","_",strtolower($user->name)).".".$extension;
            $path = $request->file('profile_picture')->storeAs('/user/profile',$completeFileName);

            $user->update(['profile_picture'=>$path]);
        }
        session()->flash('success','User Updated Successfully');
        return redirect()->route('users.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::find($id);
        $user->delete();
        session()->flash('success','User Deleted Successfully');
        return redirect()->route('users.index');
    }

    public function profile()
    {
        return view('user.profile');
    }
    public function updateProfile(Request $request,User $user)
    {
        auth()->user()->update($request->only('name','gender'));
        if($request->hasFile('profile_picture'))
        {
            //Storing Image to local disk
            $extension = $request->file('profile_picture')->getClientOriginalExtension();
            $completeFileName = str_replace(" ","_",strtolower(auth()->user()->name)).".".$extension;
            $path = $request->file('profile_picture')->storeAs('/user/profile',$completeFileName);

            auth()->user()->update(['profile_picture'=>$path]);
        }
        return redirect()->route('user.home');
    }

}

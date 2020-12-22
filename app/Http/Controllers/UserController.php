<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware(['auth','statusCheck']);
    }
    public function index()
    {
        return view('user.home');
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
            $extension = $request->file('profile_picture')->getClientOriginalExtension();
            $completeFileName = str_replace(" ","_",strtolower(auth()->user()->name)).".".$extension;
            $path = $request->file('profile_picture')->storeAs('/user/profile',$completeFileName);
            auth()->user()->update(['profile_picture'=>$path]);
        }
        return redirect()->route('user.home');
    }
}

<?php

namespace App\Http\Controllers;

use App\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('ownerCheck')->only(['show','edit','update','delete']);
        $this->middleware('postCreationPermission')->only(['create','store']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(auth()->user()->hasRole('Admin')){
          $posts = Post::paginate(15);
        }else
        {
        $posts = auth()->user()->posts()->paginate(15);
        }
        return view('post.index',compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('post.create');
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
           'title'=>['required'],
           'image'=>['required','image'],
        ]);

        //Storing Image to local disk
        $extension = $request->file('image')->getClientOriginalExtension();
        $completeFileName = str_replace(" ","_",strtolower($request->input('title'))).".".$extension;
        $path = $request->file('image')->storeAs('post/image',$completeFileName);

        $post = Post::create([
            'title'=>$request->input('title'),
            'image'=>$path,
            'user_id'=>auth()->user()->id,
            'description'=>$request->input('description')
        ]);
        if(!$post)
        {
            session()->flash('error','Issue Creating Posts');
        }
        session()->flash('success','Post Created Successfully');
        return redirect()->route('posts.index');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $post = Post::find($id);
        return view('post.show',compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $post = Post::find($id);
        return view('post.edit',compact('post'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        $request->validate([
            'title'=>['required'],
        ]);

        $post->update($request->only('title','description'));
        //Storing Image to local disk
        if($request->hasFile('image')){
            $extension = $request->file('image')->getClientOriginalExtension();
            $completeFileName = str_replace(" ","_",strtolower($request->input('title'))).$extension;
            $path = $request->file('image')->storeAs('post/image',$completeFileName);
            $post->update(['image'=>$path]);
        }
        session()->flash('success','Post Updated Successfully');
        return redirect()->route('posts.index');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $post = Post::find($id);
        $post->delete();
        session()->flash('success','Post Deleted Successfully');
        return redirect()->route('posts.index');
    }
}

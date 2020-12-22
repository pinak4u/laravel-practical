@extends('layouts.admin')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header"> Post </div>

                    <div class="card-body">
                        <table style="width: 100%" class="table-bordered table-striped">
                            <thead class="text-center">
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($posts as $post)
                                <tr>
                                    <td>{{$post->id}}</td>
                                    <td>{{$post->title}}</td>
                                    <td class="text-center">
                                        <a href="{{route('posts.show',['post'=>$post])}}" class="btn btn-sm btn-primary d-inline-block">Show</a>
                                        <a href="{{route('posts.edit',['post'=>$post])}}" class="btn btn-sm btn-warning d-inline-block">Edit</a>
                                        <form action="{{route('posts.destroy',['post'=>$post])}}" method="post" class="d-inline-block">
                                            @csrf @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                                    @endforeach
                            </tbody>
                            </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

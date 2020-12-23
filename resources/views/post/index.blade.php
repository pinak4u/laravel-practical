@extends('layouts.admin')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header"> Posts Dashboard
                        @can('post-create')
                        <a href="{{route('posts.create')}}" class="btn btn-sm btn-primary">Create Posts</a></div>
                        @endcan
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
                                        @can('post-view')
                                        <a href="{{route('posts.show',['post'=>$post])}}" class="btn btn-sm btn-primary d-inline-block">Show</a>
                                        @endcan
                                        @can('post-edit')
                                        <a href="{{route('posts.edit',['post'=>$post])}}" class="btn btn-sm btn-warning d-inline-block">Edit</a>
                                        @endcan
                                        @can('post-delete')
                                        <form action="{{route('posts.destroy',['post'=>$post])}}" method="post" class="d-inline-block">
                                            @csrf @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                        </form>
                                        @endcan
                                    </td>
                                </tr>
                                    @endforeach
                            </tbody>
                            </table>
                        <div class="mt-2">
                        {{$posts->links()}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

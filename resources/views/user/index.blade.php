@extends('layouts.user')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header"> User Dashboard </div>

                    <div class="card-body">
                        @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif

                    <table style="width: 100%" class="table-bordered table-striped">
                                <thead class="text-center">
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Gender</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($users as $user)
                                    <tr>
                                        <td>{{$user->name}}</td>
                                        <td>{{$user->email}}</td>
                                        <td>{{$user->gender}}</td>
                                        <td>{{$user->status}}</td>
                                        <td class="text-center">
                                            <a href="{{route('users.show',['user'=>$user])}}" class="btn btn-sm btn-primary d-inline-block">Show</a>
                                            <a href="{{route('users.edit',['user'=>$user])}}" class="btn btn-sm btn-warning d-inline-block">Edit</a>
                                            <form action="{{route('users.destroy',['user'=>$user])}}" method="post" class="d-inline-block">
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

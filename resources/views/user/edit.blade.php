@extends('layouts.admin')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header"> Update User </div>

                    <div class="card-body">
                        <form action="{{route('users.update',['user'=>$user])}}" method="post" enctype="multipart/form-data">
                            @csrf @method('PUT')
                            <div>
                                <label for="name"><strong>Name</strong></label>
                                <input type="text" name="name" id="name" class="form-control" value="{{$user->name}}">
                                @error('name')
                                <div class="alert alert-danger">
                                    {{$message}}
                                </div>
                                @enderror
                            </div>
                            <div>
                                <label for="email"><strong>Email</strong></label>
                                <input type="text" name="email" id="email" class="form-control" value="{{$user->email}}" disabled>
                            </div>
                            <div class="mt-2 mt-2">
                                <label for="profile_picture" class="d-block"><strong>Profile Picture</strong></label>
                                @if(str_contains($user->profile_picture,'unsplash'))
                                    <img src="{{asset($user->profile_picture)}}" id="image"
                                         alt="{{$user->profile_picture}} profile picture" class="d-block" style="width: 150px">
                                @else
                                    <img src="{{asset('storage/'.$user->profile_picture)}}" id="image"
                                         alt="{{$user->profile_picture}} profile picture" class="d-block" style="width: 150px">
                                @endif
                                <input type="file" name="profile_picture" id="profile_picture" class="form-control">
                                @error('profile_picture')
                                <div class="alert alert-danger">
                                    {{$message}}
                                </div>
                                @enderror
                            </div>
                            <div class="mt-2">
                                <label for="gender" class="d-block"><strong>Gender</strong></label>
                                <label for="male">Male
                                    <input type="radio" name="gender" value="male" class="d-inline-block" {{$user->gender=='male'?'checked':''}}>
                                </label>
                                <label for="female">Female
                                    <input type="radio" name="gender" value="female" class="d-inline-block" {{$user->gender=='female'?'checked':''}} >
                                </label>
                            </div>
                            <div class="mt-2">
                                <label for="Status" class="d-block"><strong>Status</strong></label>
                                <label for="male">Active
                                    <input type="radio" name="status" value="active" class="d-inline-block" {{$user->status=='active'?'checked':''}}>
                                </label>
                                <label for="male">Suspended
                                    <input type="radio" name="status" value="suspended" class="d-inline-block" {{$user->status=='suspended'?'checked':''}}>
                                </label>
                                <label for="male">Deactive
                                    <input type="radio" name="status" value="deactive" class="d-inline-block"  {{$user->deactive=='deactive'?'checked':''}}>
                                </label>
                            </div>
                            <div class="mt-2">
                                <label for="Status" class="d-block"><strong>Permissions</strong></label>
                                @foreach($permissions as $permission)
                                    <label for="permission_{{$permission->id}}">{{Str::ucfirst(explode("-",$permission->name)[1])}}
                                        <input id="permission_{{$permission->id}}" type="checkbox" name="permissions[]"
                                               value="{{$permission->id}}" class="d-inline-block mr-2"
                                            {{in_array($permission->id,$currentPermissions)?"checked":""}}
                                        >
                                    </label>
                                @endforeach
                            </div>
                            <button type="submit" class="btn btn-primary mt-2">Update User</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

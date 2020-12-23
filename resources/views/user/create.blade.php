@extends('layouts.admin')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header"> Create User </div>

                    <div class="card-body">
                        <form action="{{route('users.store')}}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div>
                                <label for="name"><strong>Name</strong></label>
                                <input type="text" name="name" id="name" class="form-control" >
                                @error('name')
                                    <div class="alert alert-danger">
                                        {{$message}}
                                    </div>
                                @enderror
                            </div>
                            <div>
                                <label for="email"><strong>Email</strong></label>
                                <input type="text" name="email" id="email" class="form-control" >
                                @error('email')
                                <div class="alert alert-danger">
                                    {{$message}}
                                </div>
                                @enderror
                            </div>
                            <div>
                                <label for="password"><strong>Password</strong></label>
                                <input type="password" name="password" id="password" class="form-control" >
                                @error('passowrd')
                                <div class="alert alert-danger">
                                    {{$message}}
                                </div>
                                @enderror
                            </div>
                            <div>
                                <label for="confirm_password"><strong>Confirm Password</strong></label>
                                <input type="password" name="password_confirmation" id="password_confirmation" class="form-control" >
                            </div>
                            <div class="mt-2 mt-2">
                                <label for="profile_picture" class="d-block"><strong>Profile Picture</strong></label>
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
                                    <input type="radio" name="gender" value="male" class="d-inline-block" checked>
                                </label>
                                <label for="female">Female
                                    <input type="radio" name="gender" value="female" class="d-inline-block" >
                                </label>
                            </div>
                            <div class="mt-2">
                                <label for="Status" class="d-block"><strong>Status</strong></label>
                                <label for="male">Active
                                    <input type="radio" name="status" value="active" class="d-inline-block" checked>
                                </label>
                                <label for="male">Suspended
                                    <input type="radio" name="status" value="suspended" class="d-inline-block" }}>
                                </label>
                                <label for="male">Deactive
                                    <input type="radio" name="status" value="deactive" class="d-inline-block" >
                                </label>
                            </div>
                            <div class="mt-2">
                                <label for="Status" class="d-block"><strong>Permissions</strong></label>
                                @foreach($permissions as $permission)
                                    <label for="permission_{{$permission->id}}">{{Str::ucfirst(explode("-",$permission->name)[1])}}
                                        <input id="permission_{{$permission->id}}" type="checkbox" name="permissions[]" value="{{$permission->id}}" class="d-inline-block mr-2" >
                                    </label>
                                @endforeach
                            </div>
                            <button type="submit" class="btn btn-primary mt-2">Create User</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

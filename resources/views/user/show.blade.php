@extends('layouts.admin')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header"> Show User </div>

                    <div class="card-body">
                            <div>
                                <label for="name"><strong>Name</strong></label>
                                <input type="text" name="name" id="name" class="form-control" disabled value="{{$user->name}}">
                            </div>
                            <div>
                                <label for="email"><strong>Email</strong></label>
                                <input type="text" name="email" id="email" class="form-control" disabled value="{{$user->email}}">
                            </div>
                            <div class="mt-2 mt-2">
                                @if(str_contains($user->profile_picture,'unsplash'))
                                    <img src="{{asset($user->profile_picture)}}" id="image"
                                         alt="{{$user->profile_picture}} user profile" class="d-block" style="width: 150px">
                                @else
                                    <img src="{{asset('storage/'.$user->profile_picture)}}" id="image"
                                         alt="{{$user->profile_picture}} user profile" class="d-block" style="width: 150px">
                                @endif
                                <label for="profile_picture" class="d-block"><strong>Profile Picture</strong></label>
                            </div>
                            <div class="mt-2">
                                <label for="gender" class="d-block"><strong>Gender</strong></label>
                                <label for="male">Male
                                    <input type="radio" name="gender" value="male" class="d-inline-block" checked disabled>
                                </label>
                                <label for="female">Female
                                    <input type="radio" name="gender" value="female" class="d-inline-block" disabled>
                                </label>
                            </div>
                            <div class="mt-2">
                                <label for="Status" class="d-block"><strong>Status</strong></label>
                                <label for="male">Active
                                    <input type="radio" name="status" value="active" class="d-inline-block" {{$user->status=="active"?"checked":""}} disabled>
                                </label>
                                <label for="male">Suspended
                                    <input type="radio" name="status" value="suspended" class="d-inline-block" {{$user->status=="suspended"?"checked":""}} disabled>
                                </label>
                                <label for="male">Deactive
                                    <input type="radio" name="status" value="deactive" class="d-inline-block" {{$user->status=="deactive"?"checked":""}} disabled>
                                </label>
                            </div>
                            <div class="mt-2">
                                <label for="Status" class="d-block"><strong>Permissions</strong></label>
                                @foreach($permissions as $permission)
                                    <label for="permission_{{$permission->id}}">{{Str::ucfirst(explode("-",$permission->name)[1])}}
                                        <input id="permission_{{$permission->id}}" type="checkbox" name="permissions[]" value="{{$permission->id}}" class="d-inline-block mr-2"
                                        {{in_array($permission->id,$currentPermissions)?"checked":""}} disabled>
                                    </label>
                                @endforeach
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

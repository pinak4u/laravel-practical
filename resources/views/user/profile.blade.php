@extends('layouts.user')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header"> User Profile</div>

                    <div class="card-body">
                        @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif
                            <form action="{{route('user.profile.update',[auth()->user()])}}" method="post" enctype="multipart/form-data">
                                @csrf
                                @method('PATCH')
                        <div>
                            <label for="name"><strong>Name</strong></label>
                            <input type="text" name="name" id="name" class="form-control"
                                   value="{{auth()->user()->name}}">
                        </div>
                        <div class="mt-2 mt-2">
                            <label for="profile_picture" class="d-block"><strong>Profile Picture</strong></label>
                            <img src="{{asset('storage/'.auth()->user()->profile_picture)}}" id="profile_picture_preview"
                                 alt="{{auth()->user()->name}} profile picture" class="d-block" style="width: 150px">
                            <input type="file" name="profile_picture" id="profile_picture" class="form-control">
                        </div>
                        <div class="mt-2">
                            <label for="email"><strong>Email</strong></label>
                            <input type="text" name="email" id="email" class="form-control" disabled
                                   value="{{auth()->user()->email}}">
                        </div>
                        <div class="mt-2">
                            <label for="gender" class="d-block"><strong>Gender</strong></label>
                            <label for="male">Male
                            <input type="radio" name="gender" value="male" class="d-inline-block" {{auth()->user()->gender=="male"?"checked":""}}>
                            </label>
                            <label for="female">Female
                            <input type="radio" name="gender" value="female" class="d-inline-block" {{auth()->user()->gender=="female"?"checked":""}}>
                            </label>
                        </div>
{{--                        <div class="mt-2">--}}
{{--                            <label for="Status" class="d-block"><strong>Status</strong></label>--}}
{{--                            <label for="male">Active--}}
{{--                                <input type="radio" name="status" value="active" class="d-inline-block" {{auth()->user()->status=="active"?"checked":""}}>--}}
{{--                            </label>--}}
{{--                            <label for="male">Suspended--}}
{{--                                <input type="radio" name="status" value="suspended" class="d-inline-block" {{auth()->user()->status=="suspended"?"checked":""}}>--}}
{{--                            </label>--}}
{{--                            <label for="male">Deactive--}}
{{--                                <input type="radio" name="status" value="deactive" class="d-inline-block" {{auth()->user()->status=="deactive"?"checked":""}}>--}}
{{--                            </label>--}}
{{--                        </div>--}}
                            <button type="submit" class="btn btn-primary pull-right mt-2">Update Profile</button>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@php $layout = auth()->user()->id == 1 ? 'layouts.admin':  'layouts.user' @endphp
@extends($layout)
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header"> Post </div>

                    <div class="card-body">
                        <div>
                            <label for="name"><strong>Title</strong></label>
                            <input type="text" name="name" id="name" class="form-control"
                                   value="{{$post->title}}" disabled>
                        </div>
                        <div class="mt-2 mt-2">
                            <label for="image" class="d-block"><strong>Profile Picture</strong></label>
                            @if(str_contains($post->image,'unsplash'))
                                <img src="{{asset($post->image)}}" id="image"
                                     alt="{{$post->image}} post image" class="d-block" style="width: 640px">
                            @else
                                <img src="{{asset('storage/'.$post->image)}}" id="image"
                                     alt="{{$post->image}} post image" class="d-block" style="width: 640px">
                            @endif
{{--                            <img src="{{asset('storage/'.$post->image)}}" id="image"--}}
{{--                                 alt="{{$post->image}} post image" class="d-block" style="width: 640px">--}}
{{--                            <input type="file" name="image" id="image" class="form-control">--}}
                        </div>
                        <div class="mt-2">
                            <label for="description"><strong>Description</strong></label>
                            <textarea name="description" id="description" cols="30" rows="10" class="form-control" disabled>{{$post->description}}</textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

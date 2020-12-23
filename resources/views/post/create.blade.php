@php $layout = auth()->user()->id == 1 ? 'layouts.admin':  'layouts.user' @endphp
@extends($layout)
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header"> Post </div>

                    <div class="card-body">
                        <form action="{{route('posts.store')}}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div>
                                <label for="title"><strong>Title</strong></label>
                                <input type="text" name="title" id="title" class="form-control" >
                            </div>
                            <div class="mt-2 mt-2">
                                <label for="image" class="d-block"><strong>Post Image</strong></label>
                                <input type="file" name="image" id="image" class="form-control">
                            </div>
                            <div class="mt-2">
                                <label for="description"><strong>Description</strong></label>
                                <textarea name="description" id="description" cols="30" rows="10" class="form-control" ></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary mt-2">Create Post</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model;
use Faker\Generator as Faker;
use App\Post;
$factory->define(Post::class, function (Faker $faker) {
    return [
        'title'=>$faker->sentence,
        'image'=>$faker->imageUrl(640,480,null,true,'random',false),
        'description'=>$faker->text(500),
        'user_id'=>$faker->randomElement([1,2,3,4,5,6,7,8,9,10])
    ];
});

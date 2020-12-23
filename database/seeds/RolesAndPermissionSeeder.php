<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Artisan;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\User;
class RolesAndPermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Commands for Generating roles
        Artisan::call('permission:create-role Admin');
        Artisan::call('permission:create-role User');

        //Commands for Generating permissions
        Artisan::call('permission:create-permission post-create');
        Artisan::call('permission:create-permission post-view');
        Artisan::call('permission:create-permission post-edit');
        Artisan::call('permission:create-permission post-delete');

        //Assigning admin role to user 1
        User::find(1)->assignRole('Admin');
        Role::find(1)->givePermissionTo(['post-create','post-view','post-edit','post-delete']);


        //Assigning permission to user role, it will be default role for new user.
        Role::find(2)->givePermissionTo('post-view');

        //Generating Random Permissions to users
        User::find(2)->syncPermissions([1,2,3]);
        User::find(3)->syncPermissions([2,3]);
        User::find(4)->syncPermissions([1,2]);
        User::find(5)->syncPermissions([3,4]);
        User::find(6)->syncPermissions([2,3]);
        User::find(7)->syncPermissions([1,3]);
        User::find(8)->syncPermissions([1,2,3]);
        User::find(9)->syncPermissions([1,2,3,4]);
        User::find(10)->syncPermissions([1,2,4]);
    }
}

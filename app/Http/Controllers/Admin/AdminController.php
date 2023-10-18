<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Mockery\Matcher\Type;


class AdminController extends Controller
{
    // Admin dashboard
    public function admin_dashboard()
    {
        return view('admin.index');
    }

    // Admin login
    public function adminlogin()
    {
        return view('admin.admin_login');
    }

    // Admin Profile
    public function adminProfile()
    {
        $id = Auth::user()->id;
        $adminInfo = User::find($id);
        return view('admin.admin_profile', compact('adminInfo'));
    }
    // Admin adminchangePassword
    public function adminchangePassword()
    {
        return view('admin.admin_change_password');
    }
    // Admin adminpasswordUpdate
    public function adminpasswordUpdate(Request $request)
    {
        //Match old password
        if (!Hash::check($request->old_password, Auth::user()->password)) {
            return back()->with('error', "Old Password Doesn't Match!!");
        }

        //update the password
        User::whereId(Auth::user()->id)->update([
            "password" => Hash::make($request->new_password)
        ]);
        return back()->with('status', "Password Updated Successfully!");
    }

    // Admin Profile update
    public function adminProfileUpdate(Request $request)
    {
        $id = Auth::user()->id;
        $adminUser = User::find($id);

        $adminUser->name = strtoupper($request->name);
        $adminUser->email = $request->email;

        if ($image = $request->file('newphoto')) {
            $customImageName = uniqid() . '.' . $image->getClientOriginalExtension();
            @unlink(public_path('backend/upload/admin/images/' . $adminUser->photo));
            $image->move(public_path('backend/upload/admin/images/'), $customImageName);
        } else {
            $customImageName = $adminUser->photo;
        }

        $adminUser->photo = $customImageName;

        $adminUser->phone = $request->phone;
        $adminUser->address = $request->address;

        $adminUser->update();

        $notification = array(
            'message' => "Admin Profile Updated Successfully",
            'alert-type' => "success",
        );

        return redirect()->back()->with($notification);
    }

    // Vendor active
    public function activeVendor()
    {
        $activeVendors = DB::table('users')->where('role', 'vendor')->where('status', 'active')->get();
        return view('backend.vendor.vendor_active_all', compact('activeVendors'));
    }
    // Vendor inactive
    public function inactiveVendor()
    {
        $inactiveVendors = DB::table('users')->where('role', 'vendor')->where('status', 'inactive')->get();
        return view('backend.vendor.vendor_inactive_all', compact('inactiveVendors'));
    }

    // Vendor Delete

    public function vendorDelete($id)
    {
        // Query builder or DB builder
        $vendors = DB::table('users')->where('id', $id)->get();
        // echo gettype($vendors);

        DB::table('users')->where('id', $id)->delete();

        $notification = array(
            'message' => "Vendor Delete Successfully",
            'alert-type' => "warning"
        );

        foreach ($vendors as $key => $vendor) {

            if ($vendor->status == 'active') {
                return redirect()->route('vendor.active')->with($notification);
            } else {
                return redirect()->route('vendor.inactive')->with($notification);
            }
        }
    }



    // Vendor Update

    public function updateVendor(Request $request, string $id)
    {

        // Query builder or DB builder
        DB::table('users')->where('id', $id)->update([
            "name" => $request->fullname,
            "phone" => $request->phone,
            "address" => $request->address,
            "status" => $request->status,
            "updated_at" => now()

        ]);

        // Query builder or DB builder .. ei part foreach er jonno
        $vendors = DB::table('users')->where('id', $id)->get();
        // echo gettype($vendors);

        $notification = array(
            'message' => "category Updated Successfully",
            'alert-type' => "success",
        );

        foreach ($vendors as $key => $vendor) {

            if ($vendor->status == 'active') {
                return redirect()->route('vendor.active')->with($notification);
            } else {
                return redirect()->route('vendor.inactive')->with($notification);
            }
        }

    }

    // Admin logout
    public function adminlogout(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/admin/login');
    }
}

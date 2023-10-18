<?php

namespace App\Http\Controllers\Vendor;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Validation\Rules;


class VendorController extends Controller
{
      // Vendor Login
      public function vendorLogin(){
        return view('vendor.vendor_login');
    }

      // Vendor dashboard
      public function vendor_dashboard(){
        return view('vendor.index');
    }

    // vendor Register
    public function vendorRegister(){
        return view('auth.vendor_register');
    }

    // vendorStore
    public function vendorStore(Request $request){
        // $request->validate([
        //     'name' => ['required', 'string', 'max:255'],
        //     'email' => ['required', 'string', 'email', 'max:255', 'unique:'],
        //     'password' => ['required', 'confirmed', Rules\Password::defaults()],
        // ]);
       
        $user = User::insert([
            'name' => $request->fullname,
            'username' => $request->username,
            'email' => $request->email,
            'phone' => $request->phone,
            'password' => Hash::make($request->password),
            'role' => "vendor",
            'vendor_join' => $request->vendor_join,
            'status' => "inactive",
        ]);

        $notification = array(
            'message' => "Vendor Register Successfully",
            'alert-type' => "success",
        );


        return redirect()->route('vendor.login')->with($notification);

        
    }



    // vendor logout 
    public function vendorlogout(Request $request): RedirectResponse
    {
            Auth::guard('web')->logout();
    
            $request->session()->invalidate();
    
            $request->session()->regenerateToken();
    
            return redirect('/vendor/login');
    }


     // vendor Profile vendorProfileUpdate
     public function vendorProfile(){
      $id = Auth::user()->id;
      $vendorInfo = User::find($id);
      return view('vendor.vendor_profile',compact('vendorInfo'));
  }

  // Vendor changePassword
  public function vendorchangePassword(){
    return view('vendor.vendor_change_password');
  }
  // Vendor passwordUpdate
  public function vendorpasswordUpdate(Request $request){
     //Match old password
      if(!Hash::check($request->old_password,Auth::user()->password)){
          return back()->with('error',"Old Password Doesn't Match!!");
      }

      //update the password
      User::whereId(Auth::user()->id)->update([
          "password"=>Hash::make($request->new_password)
      ]);
      return back()->with('status',"Password Updated Successfully!");
    
  }


      // vendor Profile Update
      public function vendorProfileUpdate(Request $request){
        $id = Auth::user()->id;
        $vendorUser = User::find($id);

        $vendorUser->name = strtoupper($request->name);
        $vendorUser->email = $request->email;

        if($image=$request->file('newphoto')){
            $customImageName = uniqid().'.'.$image->getClientOriginalExtension();
            @unlink(public_path('backend/upload/vendor/images/'.$vendorUser->photo));
            $image->move(public_path('backend/upload/vendor/images/'),$customImageName);
        }else{
            $customImageName = $vendorUser->photo;
        }

         $vendorUser->photo = $customImageName;

        $vendorUser->phone = $request->phone;
        $vendorUser->address = $request->address;

        $vendorUser->update();

        $notification = array(
            'message' => "Vendor Profile Updated Successfully",
            'alert-type' => "success",
        );

        return redirect()->back()->with($notification);
        
    }



}



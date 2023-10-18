<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->integer('brand_id');
            $table->integer('category_id');
            $table->integer('subcategory_id');
            $table->string('product_name');
            $table->string('product_slug');
            $table->string('product_code');
            $table->integer('product_qty');
            $table->string('product_tags');
            $table->string('product_color')->nullable();
            $table->string('product_size')->nullable();
            $table->double('product_price');
            $table->double('discoutn_price')->nullable();
            $table->string('short_descp')->nullable();
            $table->text('long_descp')->nullable();
            $table->string('product_thumbnail');
            $table->integer('vendor_id');
            $table->string('hot_deals')->nullable();
            $table->string('featured')->nullable();
            $table->string('special_offer')->nullable();
            $table->string('special_deals')->nullable();
            $table->string('status')->default(0);   // integer hole valo hoto
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};

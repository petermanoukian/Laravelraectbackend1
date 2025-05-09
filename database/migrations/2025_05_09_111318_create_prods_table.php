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
		Schema::create('prods', function (Blueprint $table) {
			$table->id();
			$table->unsignedBigInteger('catid');
			$table->unsignedBigInteger('subid');
			$table->string('name');
			$table->text('des')->nullable();
			$table->text('dess')->nullable();
			$table->float('prix')->nullable()->default(null);
			$table->integer('quan')->nullable()->default(1);
			$table->string('img')->nullable();
			$table->string('pdf')->nullable();
			$table->enum('vis', ['0', '1'])->default('0');
			$table->timestamps();

			// Uniqueness constraint
			$table->unique(['name', 'subid', 'catid']);

			// Indexes for better search
			$table->index('name');
			$table->index(['name', 'catid', 'subid']);

			// Foreign key constraints
			$table->foreign('catid')->references('id')->on('cats')->onDelete('cascade');
			$table->foreign('subid')->references('id')->on('subcats')->onDelete('cascade');
		});


    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('prods');
    }
};

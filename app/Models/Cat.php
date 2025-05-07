<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Subcat;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Cat extends Model
{
    protected $fillable = [
        'name',
    ];

	public function subcats(): HasMany
    {
        return $this->hasMany(Subcat::class, 'catid', 'id');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Prod;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Tagg extends Model
{
    
    protected $fillable = [
        'name',
    ];

    public function prods(): BelongsToMany
    {
        return $this->belongsToMany(Prod::class, 'prodtaggs', 'taggid', 'prodid')->withTimestamps();
    }

    protected static function booted()
    {
        static::deleting(function ($tagg) {
            $tagg->prods()->detach(); // Remove tagg from all products
        });
    }

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Cat;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Subcat extends Model
{
    protected $fillable = [
        'catid','name',
    ];
	
    public function cat(): BelongsTo
    {
        return $this->belongsTo(Cat::class, 'catid', 'id');
    }
	
}

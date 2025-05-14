<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Prod;
use App\Models\Tagg;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Prodtagg extends Model
{
    protected $table = 'prodtaggs';
    protected $fillable = ['prodid', 'taggid'];

    public function prod(): BelongsTo
    {
        return $this->belongsTo(Prod::class, 'prodid');
    }

    public function tagg(): BelongsTo
    {
        return $this->belongsTo(Tagg::class, 'taggid');
    }


}

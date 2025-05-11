<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Cat;
use App\Models\Subcat;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Staudenmeir\EloquentHasManyDeep\HasRelationships;

class Prod extends Model
{
    use HasRelationships;
	protected $fillable = [
        'catid', 'subid','name','des','dess','prix', 'quan' , 'img' , 'pdf' , 'vis'  , 'ordd'
    ];
	
    public function cat(): BelongsTo
    {
        return $this->belongsTo(Cat::class, 'catid', 'id');
    }
	
	public function sub(): BelongsTo
    {
        return $this->belongsTo(Subcat::class, 'subid', 'id');
    }
	
	
	public function catThroughSubcat()
    {
        return $this->belongsToThrough(
            \App\Models\Cat::class,
            \App\Models\Subcat::class,
            null,
            '',
            [\App\Models\Subcat::class => 'subid']
        );
    }
	
	/* usage 
	
	$product = Prod::with('catThroughSubcat')->find($id);

	echo $product->catThroughSubcat->name;

	
	*/

}

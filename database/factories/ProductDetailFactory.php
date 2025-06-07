<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ProductDetail>
 */
class ProductDetailFactory extends Factory
{
    protected static $product_details = [
        [1,'Sneaker2', 'XS S M L', 'black white'],
        [2,'Sneaker5', 'XS S M', 'black white'],
        [3,'Sneaker8', 'XS S M', 'black white'],
        [4, 'shirt4', 'XS S M', 'black white'],
        [5, 'f1', 'XS S M', 'black white'],
        [6, 'f2', 'XS S M', 'black white'],
        [7, 'f3', 'XS S M', 'black white'],
        [8, 'jean1', 'XS S M', 'black white'],
        [9, 'jean2', 'XS S M', 'black white'],
        [10, 'jean3', 'XS S M', 'black white'],
        [11, 'Sneaker7', 'XS S M', 'black white'],
        [12, 'shirt3', 'XS S M', 'black white'],
        [13, 'shirt2', 'XS S M', 'black white'],
        [14, 'neck1', 'XS S M', 'black white'],
        [15, 'neck2', 'XS S M', 'black white'],
        [16, 'neck3', 'XS S M', 'black white'],
        [17, 'neck4', 'XS S M', 'black white'],
        [18, 'ring1', 'XS M', 'silver gold'],
        [19, 'ring2', 'XS M', 'silver gold'],
        [20, 'ring3', 'XS M', 'silver gold'],
    ];
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */

    protected static $index = 0;
    public function definition()
    {
        // get the current product info
        $product_detail = self::$product_details[self::$index];

        // increase index, loop back to 0 if out of range
        self::$index = (self::$index + 1) % count(self::$product_details);

        return [
            'product_id' => $product_detail[0],
            'product_images' => $product_detail[1],
            'size' => $product_detail[2],
            'color' => $product_detail[3],
        ];
    }
}

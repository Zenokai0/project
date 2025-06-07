<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    protected static $products = [
        ["men's shoe", 10.99, 'men', 'shoes', 'Sneaker2'],
        ["men's shoe2", 20.99, 'men', 'shoes', 'Sneaker5'],
        ["women's shoe", 5.99, 'women', 'shoes', 'Sneaker8'],
        ["women's shirt", 14.99, 'women', 'shirts', 'shirt4'],
        ["women's sweatshirt1", 99.99, 'women', 'shirt', 'f1'],
        ["women's sweatshirt2", 100.99, 'women', 'shirt', 'f2'],
        ["women's sweatshirt3", 20.99, 'women', 'shirt', 'f3'],
        ["women's jean1", 1.99, 'women', 'jeans', 'jean1'],
        ["women's jean2", 30.99, 'women', 'jeans', 'jean2'],
        ["women's jean3", 24.99, 'women', 'jeans', 'jean3'],
        ["women's shoe9", 10.99, 'women', 'shoes', 'Sneaker7'],
        ["men shirt3", 8.99, 'men', 'shirts', 'shirt3'],
        ["men shirt10", 7.99, 'men', 'shirts', 'shirt2'],
        ["neck 1", 2.99, 'accessories', 'necklaces', 'neck1'],
        ["neck2", 3.99, 'accessories', 'necklaces', 'neck2'],
        ["le neck", 4.99, 'accessories', 'necklaces', 'neck3'],
        ["le nek 4", 5.99, 'accessories', 'necklaces', 'neck4'],
        ["ring1", 5.99, 'accessories', 'rings', 'ring1'],
        ["2 ring", 1.99, 'accessories', 'rings', 'ring2'],
        ["ring 3", 10.99, 'accessories', 'rings', 'ring3'],
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
        $product = self::$products[self::$index];

        // increase index, loop back to 0 if out of range
        self::$index = (self::$index + 1) % count(self::$products);

        return [
            'product_name' => $product[0],
            'price' => $product[1],
            'category' => $product[2],
            'subcategory' => $product[3],
            'product_image' => $product[4],
        ];
    }
}

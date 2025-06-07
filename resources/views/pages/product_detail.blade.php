@extends('layouts.second_layout')

@section('content')
<section class="product-detail">
    <div class="product-thumbnails">
        <img src="{{ asset('images/'.$product->product_images .'.jpg') }}" alt="Product">
    </div>
    <div class="product-main-image">
        <!-- <button class="arrow arrow-left">❮</button> -->
        <img src="{{ asset('images/'.$product->product_images .'.jpg') }}" alt="Product">
        <!-- <button class="arrow arrow-right">❯</button> -->
    </div>
    <div class="product-info">
        <div class="price">
            <span class="original">{{ $product->price }}</span>
        </div>
        <h2>{{ $product->product_name }}</h2>

        @php
        $sizes = explode(' ', $product->size);
        $colors = explode(' ', $product->color);
        @endphp

        <div class="colors">
            <p>Colors</p>
            @foreach ($colors as $color)
            <div class="color" style="background-color: {{ $color }}"></div> <!--ignore error, it wo-->
            @endforeach
        </div>
        <div class="sizes">
            <p>Size</p>
            @foreach ($sizes as $size)
            <button>{{ $size }}</button>
            @endforeach
        </div>
        <div class="quantity">
            <p>Quantity</p>
            <button>-</button>
            <span>1</span>
            <button>+</button>
        </div>
        <button class="add-to-bag">Add to cart</button>
        <div class="extra-info">
            <div>🚚 Fast Delivery: From 1-2 days</div>
            <div>📞 Support hotline: (+855) 089 997 916</div>
        </div>
    </div>
</section>
<script src="{{ asset('js/other_search.js') }}"></script>
<script src="{{ asset('js/product.js') }}"></script>
@endsection
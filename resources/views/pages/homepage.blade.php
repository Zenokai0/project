@extends('layouts.main_layout')

@section('content')
<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" style="margin-top: 65px;">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/Banner-1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images/banner2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images/banner3.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<h2 class="section-title">Explore Categories</h2>
<section class="categories">
    <div class="category-card" style="background-image: url('images/f1.jpg');">
        <div class="category-text">Zando</div>
        <div class="category-style">Life Style</div>
    </div>
    <div class="category-card" style="background-image: url('images/f2.jpg');">
        <div class="category-text">Ten11</div>
        <div class="category-style">Sport Life</div>
    </div>
    <div class="category-card" style="background-image: url('images/f3.jpg');">
        <div class="category-text">Gatoni</div>
        <div class="category-style">Smart Casual</div>
    </div>
    <div class="category-card" style="background-image: url('images/f4.jpg');">
        <div class="category-text">Routine</div>
        <div class="category-style">Life Style</div>
    </div>
</section>

<section class="promo-banner">
    <div class="promo-content">
        <h2>Up to 50% Off - Limited Time Only!</h2>
        <button>Shop Sale</button>
    </div>
</section>
<!-- change product here base on a tag -->
<section class="products req-product">
    <!-- req product will show here -->
</section>

<!-- featured products -->
<h2 class="section-title">Featured Products</h2>
<section class="products">
    @foreach ($products as $product)
    <a href="/product/{{ $product->product_id }}">
        <div class="product-card">
            <img src="images/{{ $product->product_image }}.jpg" alt="Men's Casual Shirt">
            <h3>{{ $product->product_name }}</h3>
            <p>{{ $product->price }}</p>
        </div>
    </a>
    @endforeach
</section>
@endsection
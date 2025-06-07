<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Zando - Fashion Retail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/header.css') }}">
    <link rel="stylesheet" href="{{ asset('css/homepage.css') }}">
    <link rel="stylesheet" href="{{ asset('css/footer.css') }}">
</head>

<body>
    <header>
        <button class="hamburger">☰</button>
        <nav class="nav-menu">
            <div class="menu-left">
                <a href="/">Home</a>
                <div class="dropdown">
                    <p>Men</p>
                    <div class="dropdown-content men">
                        <a href="#men-shoes">Shoes</a>
                        <a href="#men-shirts">Shirts</a>
                    </div>
                </div>
                <div class="dropdown">
                    <p>Women</p>
                    <div class="dropdown-content women">
                        <a href="#women-shoes">Shoes</a>
                        <a href="#women-shirts">Shirts</a>
                        <a href="#women-jeans">Jeans</a>
                    </div>
                </div>
                <div class="dropdown">
                    <p>Accessories</p>
                    <div class="dropdown-content accessories">
                        <a href="#accessories-necklaces">Necklaces</a>
                        <a href="#accessories-rings">Rings</a>
                    </div>
                </div>
            </div>
        </nav>
        <div class="logo">
            <h1><a href="/ones">ONES</a></h1>
        </div>
        <div class="menu-right">
            <form action="">
                <input type="search" name="search" placeholder="Search..." class="search-bar" autocomplete="off">
            </form>
            <a href="cart" title="Add to Bag" class="cart menu-right-btn" data-count="0">🛍️</a>
            
            @guest
            <button class="login">Login</button>
            <button class="register">Register</button>
            @endguest

            @auth
            <a title="User Account" class="account-btn">👤</a>
            <div class="profile-dropdown">
                <li class="username">{{ Auth::user()->username }}</li>
                <form action="{{ route('logout') }}" method="post">
                    @csrf
                    <button class="logout">Logout</button>
                </form>
            </div>
            @endauth

            <div class="account-menu">
                <button title="Notifications">🔔</button>
                <button title="Add to Bag" class="cart" data-count="0">🛍️</button>
            </div>
        </div>
    </header>
    <!-- login popup -->
    <div class="popup-bg"></div>
    <div class="popup">
        <button class="close">X</button>
        <div class="popup-nav">
            <button class="popup-nav-button nav-login">Login</button>
            <button class="popup-nav-button nav-reg">Register</button>
        </div>
        <div>
            <form action="{{ route('login') }}" method="post" class="login-body">
                @csrf
                <label for="username">Username</label>
                <input type="text" id="username" name="username" value="{{ old('username') }}" required>
                <label for="password">Password</label>
                <input type="password" id="password" name="password" value="{{ old('password') }}" required>
                <button type="submit" class="login-submit">Login</button>
            </form>
        </div>
        <div class="error"></div>
        <div>
            <form action="{{ route('register') }}" method="post" class="register-body">
                @csrf
                <label for="regi-username">Username</label>
                <input type="text" id="regi-username" name="username" required value="{{ old('username') }}">
                <label for="regi-password">Password</label>
                <input type="password" id="regi-password" name="password" required value="{{ old('password') }}">
                <label for="confirm-pw">Confirm Password</label>
                <input type="password" id="confirm-password" name="password_confirmation" value="{{ old('confirm-password') }}" required>
                <button type="submit" class="register-submit">Register</button>
            </form>
        </div>
    </div>

    @yield('content')

    <footer>
        <div class="footer-container">
            <div class="footer-column">
                <h4>About Zando</h4>
                <ul>
                    <li><a href="#about">About Us</a></li>
                    <li><a href="#contact">Contact Us</a></li>
                    <li><a href="#careers">Careers</a></li>
                    <li><a href="#terms">Terms & Conditions</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>Shop Categories</h4>
                <ul>
                    <li><a href="#men">Men</a></li>
                    <li><a href="#women">Women</a></li>
                    <li><a href="#accessories">Accessories</a></li>
                    <li><a href="#sale">Sale</a></li>
                </ul>
            </div>
            <div class="footer-column social">
                <h4>Follow Us</h4>
                <ul>
                    <li><a href="#facebook">📘</a></li>
                    <li><a href="#instagram">📷</a></li>
                    <li><a href="#twitter">🐦</a></li>
                    <li><a href="#pinterest">📌</a></li>
                </ul>
            </div>
            <div class="footer-column newsletter">
                <h4>Newsletter</h4>
                <p>Stay updated with our latest trends!</p>
                <form>
                    <input type="email" placeholder="Enter your email">
                    <button type="submit">Subscribe</button>
                </form>
            </div>
        </div>
        <div class="footer-bottom">
            <p>© 2025 Zando Fashion. All Rights Reserved.</p>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{ asset('js/homepage.js') }}"></script>
    <script src="{{ asset('js/account_popup.js') }}"></script>
    <script src="{{ asset('js/other_search.js') }}"></script>
    <script src="{{ asset('js/loginout.js') }}"></script>
</body>

</html>
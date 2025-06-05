const slides = document.querySelectorAll('.carousel-slide');
const dots = document.querySelectorAll('.carousel-dot');
const prevBtn = document.querySelector('.carousel-prev');
const nextBtn = document.querySelector('.carousel-next');
let currentSlide = 0;
const slideInterval = 3000;

function showSlide(index) {
    slides.forEach((slide, i) => {
        slide.classList.remove('active');
        dots[i].classList.remove('active');
    });
    slides[index].classList.add('active');
    dots[index].classList.add('active');
    currentSlide = index;
}

function nextSlide() {
    currentSlide = (currentSlide + 1) % slides.length;
    showSlide(currentSlide);
}

function prevSlide() {
    currentSlide = (currentSlide - 1 + slides.length) % slides.length;
    showSlide(currentSlide);
}

nextBtn.addEventListener('click', nextSlide);
prevBtn.addEventListener('click', prevSlide);

dots.forEach((dot, index) => {
    dot.addEventListener('click', () => {
        showSlide(index);
    });
});

let autoSlide = setInterval(nextSlide, slideInterval);

document.querySelector('.hero').addEventListener('mouseenter', () => {
    clearInterval(autoSlide);
});

document.querySelector('.hero').addEventListener('mouseleave', () => {
    autoSlide = setInterval(nextSlide, slideInterval);
});

showSlide(currentSlide);

document.querySelectorAll('.quick-view').forEach(button => {
    button.addEventListener('click', (e) => {
        e.stopPropagation();
    });
});

function openProduct(id, name, price, image, thumbnails = []) {
    const product = { id, name, price, image, thumbnails };
    localStorage.setItem('selectedProduct', JSON.stringify(product));
    window.location.href = 'product.html';
};


document.addEventListener('DOMContentLoaded', async () => {
    const hamburger = document.querySelector('.hamburger');
    const navMenu = document.querySelector('.nav-menu');
    const dropdowns = document.querySelectorAll('.dropdown');
    const accountBtn = document.querySelector('.account-btn');
    const accountMenu = document.querySelector('.account-menu');

    //check if its redirect from products page which will have a hash of #category-subcategory
    if (window.location.hash.includes('-')) {
        const hash = window.location.hash.slice(1).split('-');
        const category = hash[0]
        const subcategory = hash[1];

        let html = '';

        const response = await fetch(`http://localhost:3000/${category}/${subcategory}`)
        const data = await response.json();
        data.forEach((d, i) =>
            html += `
                <div class="product-card"
                    onclick="getDetail(${d.product_id})">
                    <img src="Images/${d.product_image}.jpg" alt="${d.product_image}">
                    <h3>${d.product_name}</h3>
                    <p>${d.price}</p>
                </div>`);

        document.querySelector('.req-product').innerHTML = html;
    }

    // Hamburger menu toggle
    if (hamburger && navMenu) {
        hamburger.addEventListener('click', () => {
            navMenu.classList.toggle('active');
            console.log('Hamburger clicked, navMenu active:', navMenu.classList.contains('active')); // Debug
        });
    } else {
        console.error('Hamburger or navMenu not found');
    }

    // Dropdown toggle for mobile
    dropdowns.forEach(dropdown => {
        dropdown.addEventListener('click', (e) => {
            if (window.innerWidth <= 768) {
                e.preventDefault();
                dropdown.classList.toggle('active');
            }
        });
    });

    //if theres user_id, user is already logged in
    if (localStorage.getItem('user_id')) {
        document.querySelector('.login').style.display = 'none';
        document.querySelector('.register').style.display = 'none'
        document.querySelector('.account-btn').style.display = 'block'
        document.querySelector('.username').innerHTML = localStorage.getItem('username');

        const item_count_res = await fetch('http://localhost:3000/item-count', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ user_id: localStorage.getItem('user_id') })
        })
        const dat = await item_count_res.json();

        if (dat[0].count) {
            const cartButton = document.querySelector('.cart');
            let cartCount = dat[0].count;

            cartButton.setAttribute('data-count', cartCount);
        }
    }

    // Account menu toggle for phone
    if (accountBtn && accountMenu) {
        accountBtn.addEventListener('click', (e) => {
            if (window.innerWidth <= 480) {
                e.preventDefault();
                accountMenu.classList.toggle('active');
            }
        });
    }

    // Close menus when clicking outside
    // document.addEventListener('click', (e) => {
    //     if (navMenu && !navMenu.contains(e.target) && !hamburger.contains(e.target)) {
    //         navMenu.classList.remove('active');
    //     }
    //     if (accountMenu && !accountMenu.contains(e.target) && !accountBtn.contains(e.target) && window.innerWidth <= 480) {
    //         accountMenu.classList.remove('active');
    //     }
    // });
});

//testing db
function getDetail(product_id) {
    localStorage.setItem('selectedProductId', product_id);
    window.location.href = 'product.html';
}
document.querySelector('.men').addEventListener('click', async (e) => {
    let html = '';

    const response = await fetch(`http://localhost:3000/men/${e.target.innerHTML}`)
    const data = await response.json();
    data.forEach((d, i) =>
        html += `
                <div class="product-card"
                    onclick="getDetail(${d.product_id})">
                    <img src="Images/${d.product_image}.jpg" alt="${d.product_image}">
                    <h3>${d.product_name}</h3>
                    <p>${d.price}</p>
                </div>`);

    document.querySelector('.req-product').innerHTML = html;
})
document.querySelector('.women').addEventListener('click', async (e) => {
    let html = '';

    const response = await fetch(`http://localhost:3000/women/${e.target.innerHTML}`)
    const data = await response.json();
    data.forEach((d, i) => {
        const product_name = JSON.stringify(d.product_name)
        html += `
                <div class="product-card"
                    onclick="getDetail(${d.product_id})">    
                    <img src="Images/${d.product_image}.jpg" alt="${d.product_image}">
                    <h3>${d.product_name}</h3>
                    <p>${d.price}</p>
                </div>`});

    document.querySelector('.req-product').innerHTML = html;
})
document.querySelector('.accessories').addEventListener('click', async (e) => {
    let html = '';

    const response = await fetch(`http://localhost:3000/accessories/${e.target.innerHTML}`)
    const data = await response.json();
    data.forEach((d, i) =>
        html += `
                <div class="product-card"
                    onclick="getDetail(${d.product_id})">
                    <img src="Images/${d.product_image}.jpg" alt="${d.product_image}">
                    <h3>${d.product_name}</h3>
                    <p>${d.price}</p>
                </div>`);
    document.querySelector('.req-product').innerHTML = html;
})

//search function
const searchbar = document.querySelector('.search-bar');
searchbar.addEventListener('keydown', (e) => {
    if (searchbar.value != '' && e.key == 'Enter') {
        localStorage.setItem('search', searchbar.value);
        window.location.href = 'search.html'
    }
})

//login signup stuff
const popup_bg = document.querySelector('.popup-bg');
const popup = document.querySelector('.popup');

const login_nav = document.querySelector('.nav-login');
const reg_nav = document.querySelector('.nav-reg');

const login_body = document.querySelector('.login-body');
const reg_body = document.querySelector('.register-body');
document.querySelector('.menu-right').addEventListener('click', e => {

    if (e.target.innerHTML == 'Login') {
        popup_bg.style.display = 'block';
        popup.style.display = 'grid';
        login_nav.classList.add('nav-active');
        reg_nav.classList.remove('nav-active');
        login_body.classList.remove('hide')
        reg_body.classList.add('hide');
    } else if (e.target.innerHTML == 'Register') {
        popup_bg.style.display = 'block';
        popup.style.display = 'grid';
        login_nav.classList.remove('nav-active');
        reg_nav.classList.add('nav-active');
        login_body.classList.add('hide')
        reg_body.classList.remove('hide')
    }
})
document.querySelector('.popup-nav').addEventListener('click', e => {
    if (e.target.innerHTML == 'Login') {
        login_nav.classList.add('nav-active');
        reg_nav.classList.remove('nav-active');
        login_body.classList.remove('hide')
        reg_body.classList.add('hide');
    } else if (e.target.innerHTML == 'Register') {
        login_nav.classList.remove('nav-active');
        reg_nav.classList.add('nav-active');
        login_body.classList.add('hide')
        reg_body.classList.remove('hide')
    }
})
document.querySelector('.close').addEventListener('click', () => {
    popup_bg.style.display = 'none';
    popup.style.display = 'none'
})
//login register submission
document.querySelector('.login-submit').addEventListener('click', () => {
    const username = document.querySelector('#username');
    const password = document.querySelector('#password');

    if (username.value != '' && password.value != '') {
        fetch('http://localhost:3000/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ username: username.value, password: password.value })
        }).then(res => res.json())
            .then(data => {
                if (data[0].user_id != null) {
                    localStorage.setItem('user_id', data[0].user_id);
                    localStorage.setItem('username', data[0].username);
                    document.querySelector('.login').style.display = 'none';
                    document.querySelector('.register').style.display = 'none'
                    document.querySelector('.account-btn').style.display = 'block'

                    popup_bg.style.display = 'none';
                    popup.style.display = 'none'

                    window.location.reload();
                }
            });
    } else {
        console.log('nah')
    }

})
document.querySelector('.register-submit').addEventListener('click', () => {
    const username = document.querySelector('#regi-username');
    const password = document.querySelector('#regi-password')
    const confirm_pw = document.querySelector("#confirm-password");

    if (username.value != '' && password.value != '' && confirm_pw.value != '') {
        if (password.value == confirm_pw.value) {
            fetch('http://localhost:3000/signup', {
                method: 'post',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ username: username.value, password: password.value })
            }).then(res => res.json())
                .then(data => {
                    if (data.msg == 'registered') {
                        login_nav.classList.add('nav-active');
                        reg_nav.classList.remove('nav-active');
                        login_body.classList.remove('hide')
                        reg_body.classList.add('hide');
                    }
                })
        } else {
            console.log('pw not match')
        }
    } else {
        console.log('nah')
    }
})
document.querySelector('.account-btn').addEventListener('click', () => {
    document.querySelector('.profile-dropdown').classList.toggle('dropdown-active');
});

document.querySelector('.logout').addEventListener('click', () => {
    localStorage.removeItem('user_id')
    document.querySelector('.profile-dropdown').classList.remove('dropdown-active');
    window.location.reload();
})
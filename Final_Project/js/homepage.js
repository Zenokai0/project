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

const cartButton = document.querySelector('.cart');
let cartCount = 0;
cartButton.setAttribute('data-count', cartCount);

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
    document.addEventListener('click', (e) => {
        if (navMenu && !navMenu.contains(e.target) && !hamburger.contains(e.target)) {
            navMenu.classList.remove('active');
        }
        if (accountMenu && !accountMenu.contains(e.target) && !accountBtn.contains(e.target) && window.innerWidth <= 480) {
            accountMenu.classList.remove('active');
        }
    });
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
    console.log(e);
    console.log()
    let html = '';

    const response = await fetch(`http://localhost:3000/women/${e.target.innerHTML}`)
    const data = await response.json();
    data.forEach((d, i) => {
        const product_name = JSON.stringify(d.product_name)
        console.log(product_name)
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


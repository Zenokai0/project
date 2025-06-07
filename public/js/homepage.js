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

        const response = await fetch(`/${category}/${subcategory}`)
        const data = await response.json();
        data.forEach((d, i) =>
            html += `
                <a href="/product/${d.product_id}">
                    <div class="product-card">
                        <img src="Images/${d.product_image}.jpg" alt="${d.product_image}">
                        <h3>${d.product_name}</h3>
                        <p>${d.price}</p>
                    </div>
                </a>`);

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

        const item_count_res = await fetch('/item-count', {
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

document.querySelector('.men').addEventListener('click', async (e) => {
    let html = '';

    const response = await fetch(`/men/${e.target.innerHTML}`)
    const data = await response.json();
    data.forEach(d =>
        html += `
                <a href="/product/${d.product_id}">
                    <div class="product-card">
                        <img src="Images/${d.product_image}.jpg" alt="${d.product_image}">
                        <h3>${d.product_name}</h3>
                        <p>${d.price}</p>
                    </div>
                </a>`);

    document.querySelector('.req-product').innerHTML = html;
})
document.querySelector('.women').addEventListener('click', async (e) => {
    let html = '';

    const response = await fetch(`/women/${e.target.innerHTML}`)
    const data = await response.json();
    data.forEach(d =>
        html += `
                <a href="/product/${d.product_id}">
                    <div class="product-card">
                        <img src="Images/${d.product_image}.jpg" alt="${d.product_image}">
                        <h3>${d.product_name}</h3>
                        <p>${d.price}</p>
                    </div>
                </a>`);

    document.querySelector('.req-product').innerHTML = html;
})
document.querySelector('.accessories').addEventListener('click', async (e) => {
    let html = '';

    const response = await fetch(`/accessories/${e.target.innerHTML}`)
    const data = await response.json();
    data.forEach(d =>
        html += `
                <a href="/product/${d.product_id}">
                    <div class="product-card">
                        <img src="Images/${d.product_image}.jpg" alt="${d.product_image}">
                        <h3>${d.product_name}</h3>
                        <p>${d.price}</p>
                    </div>
                </a>`);
    document.querySelector('.req-product').innerHTML = html;
})
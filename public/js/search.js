document.addEventListener('DOMContentLoaded', async () => {
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

    var search = localStorage.getItem('search')
    fetch('http://localhost:3000/search', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ search })
    }).then(res => res.json())
        .then(data => {
                if(data.length > 0){
                    let html = '';
    
                    data.forEach(d =>
                        html += `
                        <div class="product-card" onclick="getDetail(${d.product_id})">    
                            <img src="Images/${d.product_image}.jpg" alt="${d.product_image}">
                            <h3>${d.product_name}</h3>
                            <p>${d.price}</p>
                        </div>`
                    )
                    document.querySelector('.search-result').innerHTML = html;
                } else {
                    document.querySelector('.search-result').innerHTML = '0 result'
                }
            });
});

function getDetail(product_id) {
    localStorage.setItem('selectedProductId', product_id);
    window.location.href = 'product.html';
}

//search function
const searchbar = document.querySelector('.search-bar');
searchbar.addEventListener('keydown', (e) => {
    var search = localStorage.getItem('search')
    if (searchbar.value != '' && e.key == 'Enter') {
        localStorage.setItem('search', searchbar.value);

        fetch('http://localhost:3000/search', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ search: searchbar.value })
        }).then(res => res.json())
            .then(data => {
                if(data.length > 0){
                    let html = '';
    
                    data.forEach(d =>
                        html += `
                        <div class="product-card" onclick="getDetail(${d.product_id})">    
                            <img src="Images/${d.product_image}.jpg" alt="${d.product_image}">
                            <h3>${d.product_name}</h3>
                            <p>${d.price}</p>
                        </div>`
                    )
                    document.querySelector('.search-result').innerHTML = html;
                } else {
                    document.querySelector('.search-result').innerHTML = '0 result'
                }
            });
    }
})
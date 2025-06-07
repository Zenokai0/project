var cart_array = [];
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

    const user_id = localStorage.getItem('user_id');
    if (user_id) {
        const response = await fetch(`http://localhost:3000/get-user-cart/${user_id}`);
        const data = await response.json();

        let html = '';

        if (data.length) {
            data.forEach(d => {
                cart_array.push(d);
            })

            cart_array.forEach(c =>
                html += `
                <div class="item">
                    <img src="./images/${c.product_image}.jpg" alt="">
                    <div class="detail">
                        <h1>${c.product_name}</h1>
                        <p>${c.price}</p>
                    </div>
                    <button class="delete" id="${c.user_cart_id} ${c.product_id}">delete</button>
                </div>`
            )
            document.querySelector('.cart-body').innerHTML = html;
        } else {
            document.querySelector('.checkout').style.display = 'none';
        }
    } else {
        document.querySelector('.checkout').style.display = 'none';
    }
})
document.querySelector('.cart-body').addEventListener('click', (e) => {
    const cart_id = e.target.id.slice(0, e.target.id.indexOf(' '));
    const product_id = e.target.id.slice(e.target.id.indexOf(' ') + 1)

    fetch(`http://localhost:3000/remove-from-cart`, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ user_cart_id: cart_id, product_id: product_id })
    })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                let html = '';
                cart_array = cart_array.filter(c => !(c.user_cart_id == cart_id && c.product_id == product_id));

                cart_array.forEach(c =>
                    html += `
                <div class="item">
                    <img src="./images/${c.product_image}.jpg" alt="">
                    <div class="detail">
                        <h1>${c.product_name}</h1>
                        <p>${c.price}</p>
                    </div>
                    <button class="delete" id="${c.user_cart_id} ${c.product_id}">delete</button>
                </div>`
                )
                document.querySelector('.cart-body').innerHTML = html;
                //cart item count
                const cartButton = document.querySelector('.cart');
                console.log(typeof cartButton.getAttribute('data-count'));
                let cartCount = cartButton.getAttribute('data-count') - 1;

                cartButton.setAttribute('data-count', cartCount);
            }
        });
})
//checkout function
document.querySelector('.checkout').addEventListener('click', () => {
    //a checkout would be posting it to the seller db, but we not gonna it so, just delete all from user_cart with user_id
    fetch(`http://localhost:3000/checkout`, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ user_id: localStorage.getItem('user_id') })
    }).then(res => res.json())
        .then(data => {
            if (data.success) {
                cart_array = [];

                document.querySelector('.cart-body').innerHTML = '';
                document.querySelector('.checkout').style.display = 'none';

                //cart item count
                const cartButton = document.querySelector('.cart');
                let cartCount = 0;

                cartButton.setAttribute('data-count', cartCount);
            }
        });
})


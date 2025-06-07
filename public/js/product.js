
const selectedProductId = localStorage.getItem('selectedProductId');
//product id and fetch from db
function getDetail() {

    document.querySelector('.colors :nth-child(2)').classList.add('active'); //add active class to the first div, which is 2nd child
    document.querySelector('.sizes :nth-child(2)').classList.add('active'); //add active class to the first button, which is 2nd child

    // Color Selection
    const colorSwatches = document.querySelectorAll('.colors .color');
    colorSwatches.forEach(swatch => {
        swatch.addEventListener('click', () => {
            colorSwatches.forEach(s => s.classList.remove('active'));
            swatch.classList.add('active');
        });
    });

    // Size Selection
    const sizeButtons = document.querySelectorAll('.sizes button');
    sizeButtons.forEach(button => {
        button.addEventListener('click', () => {
            sizeButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
        });
    });

    const user_id = localStorage.getItem('user_id')
    if (user_id) {

        //add to cart button
        document.querySelector('.add-to-bag').addEventListener('click', () => {
            fetch('http://localhost:3000/add-to-cart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ user_id: user_id, product_id: selectedProductId })
            }).then(res => res.json())
                .then(data => {
                    if (data.success) {
                        //cart item count
                        const cartButton = document.querySelector('.cart');
                        let cartCount = Number(cartButton.getAttribute('data-count')) + 1;

                        cartButton.setAttribute('data-count', cartCount);
                    }
                });
        })
    }

}
getDetail();

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
})

// Quantity Selector
const quantityMinus = document.querySelector('.quantity button:nth-child(2)');
const quantityPlus = document.querySelector('.quantity button:last-child');
const quantityDisplay = document.querySelector('.quantity span');
let quantity = 1;

quantityMinus.addEventListener('click', () => {
    if (quantity > 1) {
        quantity--;
        quantityDisplay.textContent = quantity;
    }
});

quantityPlus.addEventListener('click', () => {
    quantity++;
    quantityDisplay.textContent = quantity;
});
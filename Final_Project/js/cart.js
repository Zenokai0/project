var cart_array = [];
document.addEventListener('DOMContentLoaded', async () => {
    //if theres user_id, user is already logged in
    if (localStorage.getItem('user_id')) {
        document.querySelector('.login').style.display = 'none';
        document.querySelector('.register').style.display = 'none'
        document.querySelector('.account-btn').style.display = 'block'
    }

    const user_id = localStorage.getItem('user_id');
    if(user_id){
        const response = await fetch(`http://localhost:3000/get-user-cart/${user_id}`);
        const data = await response.json();

        let html = '';
        console.log(data.length != 0)
        // cart_array.push(data);
        if(data.length) {
            data.forEach(d => {
                console.log(d);
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
        } else{
            document.querySelector('.checkout').style.display = 'none';
        }
    } else{
        document.querySelector('.checkout').style.display = 'none';
    }
})
document.querySelector('.cart-body').addEventListener('click', (e) => {
    console.log('array', cart_array)
    console.log(e.target.id);
    const cart_id = e.target.id.slice(0, e.target.id.indexOf(' '));
    const product_id = e.target.id.slice(e.target.id.indexOf(' ') + 1)

    console.log(product_id)
    fetch(`http://localhost:3000/remove-from-cart`, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({user_cart_id: cart_id, product_id: product_id})
    })
    .then(res => res.json())
    .then(data => {
        if(data.success){
            let html = '';
            cart_array = cart_array.filter( c => !(c.user_cart_id == cart_id && c.product_id == product_id));

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
        }
    });
})
//checkout function
document.querySelector('.checkout').addEventListener('click', () => {
    console.log(localStorage.getItem('user_id'));
    //a checkout would be posting it to the seller db, but we not gonna it so, just delete all from user_cart with user_id
    fetch(`http://localhost:3000/checkout`, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({user_id: localStorage.getItem('user_id')})
    }).then(res => res.json())
    .then(data => {
        if(data.success){
            cart_array = [];

            document.querySelector('.cart-body').innerHTML = '';
            document.querySelector('.checkout').style.display = 'none';
        }
    });
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
        console.log('yeh')
        fetch('http://localhost:3000/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ username: username.value, password: password.value })
        }).then(res => res.json())
            .then(data => {
                if (data[0].user_id != null) {
                    console.log(data)
                    localStorage.setItem('user_id', data[0].user_id);
                    localStorage.setItem('username', data[0].username);
                    document.querySelector('.login').style.display = 'none';
                    document.querySelector('.register').style.display = 'none'
                    document.querySelector('.account-btn').style.display = 'block'

                    popup_bg.style.display = 'none';
                    popup.style.display = 'none';

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
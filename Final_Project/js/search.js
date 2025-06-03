console.log(localStorage.getItem('search'))

document.addEventListener('DOMContentLoaded', async () => {
    //if theres user_id, user is already logged in
    if (localStorage.getItem('user_id')) {
        document.querySelector('.login').style.display = 'none';
        document.querySelector('.register').style.display = 'none'
        document.querySelector('.account-btn').style.display = 'block'
        document.querySelector('.username').innerHTML = localStorage.getItem('username');
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
    console.log(e.key == 'Enter');
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
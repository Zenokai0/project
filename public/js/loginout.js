
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
document.querySelector('.login-submit').addEventListener('click', (e) => {
    e.preventDefault();
    const username = document.querySelector('#username');
    const password = document.querySelector('#password');

    fetch('/login', {
        method: 'post',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            'Accept': 'application/json'
        },
        body: JSON.stringify({ username: username.value, password: password.value })
    }).then(res => res.json())
        .then(data => {
            if (data.errors) {
                const error = document.querySelector('.error');
                let html = '';

                for (const key in data.errors) {
                    data.errors[key].forEach(msg => {
                        html += `<p style='color:red'>${msg}</p>`
                    });
                    error.innerHTML = html;
                }
            } else if (data.msg == 'logged in') {
                location.reload();
            }
        });
    // .then(data => {
    //     if (data[0].user_id != null) {
    //         localStorage.setItem('user_id', data[0].user_id);
    //         localStorage.setItem('username', data[0].username);
    //         document.querySelector('.login').style.display = 'none';
    //         document.querySelector('.register').style.display = 'none'
    //         document.querySelector('.account-btn').style.display = 'block'

    //         popup_bg.style.display = 'none';
    //         popup.style.display = 'none'

    //         window.location.reload();
    //     }
    // });

})
document.querySelector('.register-submit').addEventListener('click', (e) => {
    e.preventDefault();
    const username = document.querySelector('#regi-username');
    const password = document.querySelector('#regi-password')
    const confirm_pw = document.querySelector("#confirm-password");

    fetch('/register', {
        method: 'post',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            'Accept': 'application/json'
        },
        body: JSON.stringify({ username: username.value, password: password.value, password_confirmation: confirm_pw.value })
    }).then(res => res.json())
        .then(data => {
            if (data.errors) {
                const error = document.querySelector('.error');
                let html = '';

                for (const key in data.errors) {
                    data.errors[key].forEach(msg => {
                        html += `<p style='color:red'>${msg}</p>`
                    });
                    error.innerHTML = html;
                }
            } else if (data.msg == 'registered') {
                location.reload();
            }
        })
})
document.querySelector('.account-btn').addEventListener('click', () => {
    document.querySelector('.profile-dropdown').classList.toggle('dropdown-active');
});

document.querySelector('.logout').addEventListener('click', () => {
    localStorage.removeItem('user_id')
    document.querySelector('.profile-dropdown').classList.remove('dropdown-active');
    window.location.reload();
})
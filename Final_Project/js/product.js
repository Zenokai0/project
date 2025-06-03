
const selectedProductId = localStorage.getItem('selectedProductId');
//product id and fetch from db
async function getDetail() {
    console.log(selectedProductId)
    const response = await fetch(`http://localhost:3000/get-details/${selectedProductId}`);
    const data = await response.json();
    console.log('hello');
    console.log(data[0])

    document.querySelector('.product-info h2').textContent = data[0].product_name;
    document.querySelector('.price .original').textContent = data[0].price;
    document.querySelector('.price .discounted').textContent = data[0].discountedPrice || '';
    const mainImage = document.querySelector('.product-main-image img');
    mainImage.src = 'Images/' + data[0].product_images + '.jpg';
    mainImage.alt = data[0].product_name;
    document.querySelector('.product-thumbnails img').src = 'Images/' + data[0].product_images + '.jpg';

    const sizes = data[0].size.split(' ');
    const colors = data[0].color.split(' ');

    //add all colors to display
    colors.forEach(c => {
        document.querySelector('.colors').innerHTML += `<div class="color" style="background-color:${c}"></div>`
    })
    //add all sizes to display
    sizes.forEach(s => {
        document.querySelector('.sizes').innerHTML += `<button>${s}</button>`
    })
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
    if(user_id){

        //add to cart button
        document.querySelector('.add-to-bag').addEventListener('click', () => {
            fetch('http://localhost:3000/add-to-cart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({user_id: user_id, product_id: selectedProductId})
            }).then(res => res.json())
            .then(data => console.log(data));
        })
    }

}
getDetail();

document.addEventListener('DOMContentLoaded', () => {
    //if theres user_id, user is already logged in
    if (localStorage.getItem('user_id')) {
        document.querySelector('.login').style.display = 'none';
        document.querySelector('.register').style.display = 'none'
        document.querySelector('.account-btn').style.display = 'block'
    }
})


// Update the page with selected product data

// Update thumbnails (use provided thumbnails or fallback to main image)
// const thumbnails = document.querySelectorAll('.product-thumbnails img');
// const thumbnailImages = selectedProduct.thumbnails.length > 0 ? selectedProduct.thumbnails : [selectedProduct.image, selectedProduct.image, selectedProduct.image];
// thumbnails.forEach((thumb, index) => {
//     if (thumbnailImages[index]) {
//         thumb.src = thumbnailImages[index];
//         thumb.alt = `${selectedProduct.name} Thumbnail ${index + 1}`;
//     }
// });

// Thumbnail and Main Image Switching
// const arrowLeft = document.querySelector('.arrow-left');
// const arrowRight = document.querySelector('.arrow-right');
// let currentImageIndex = 0;
// const images = thumbnailImages;

// function updateMainImage(index) {
//     thumbnails.forEach(thumb => thumb.classList.remove('active'));
//     thumbnails[index].classList.add('active');
//     mainImage.src = images[index];
//     currentImageIndex = index;
// }

// thumbnails.forEach((thumb, index) => {
//     thumb.addEventListener('click', () => {
//         updateMainImage(index);
//     });
// });

// arrowLeft.addEventListener('click', () => {
//     currentImageIndex = (currentImageIndex - 1 + images.length) % images.length;
//     updateMainImage(currentImageIndex);
// });

// arrowRight.addEventListener('click', () => {
//     currentImageIndex = (currentImageIndex + 1) % images.length;
//     updateMainImage(currentImageIndex);
// });


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
                    console.log(localStorage.getItem('user_id'));
                    document.querySelector('.login').style.display = 'none';
                    document.querySelector('.register').style.display = 'none'
                    document.querySelector('.account-btn').style.display = 'block'

                    popup_bg.style.display = 'none';
                    popup.style.display = 'none'
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
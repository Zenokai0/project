//search function outside search page
const searchbar = document.querySelector('.search-bar');
searchbar.addEventListener('keydown', (e) => {
    if (searchbar.value != '' && e.key == 'Enter') {
        localStorage.setItem('search', searchbar.value);
        window.location.href = 'search.html'
    }
})
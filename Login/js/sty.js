const dropdown = document.getElementById('navbarDropdown');
        const chevronIcon = document.querySelector('.chevron-icon');

        dropdown.addEventListener('click', function() {
            if (dropdown.getAttribute('aria-expanded') === 'true') {
                chevronIcon.classList.add('rotate');
            } else {
                chevronIcon.classList.remove('rotate');
            }
        });
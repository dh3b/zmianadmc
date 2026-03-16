document.addEventListener('DOMContentLoaded', () => {
    const phoneNumber = '__PHONE_NUMBER__';
    const email = '__EMAIL__';

    const CONTACT = {
        phone: { display: phoneNumber, href: `tel:${phoneNumber.replace(/\s+/g, '')}` },
        email: { display: email, href: `mailto:${email.trim()}` }
    };

    document.querySelectorAll('[data-contact]').forEach(el => {
        const info = CONTACT[el.dataset.contact];
        if (!info) return;

        el.href = info.href;
        const textNode = el.querySelector('.contact-text, .cc-value');
        if (textNode) textNode.textContent = info.display;
    });

    /* ── Fade-in observer ── */
    const els = document.querySelectorAll('.fade-in');
    if ('IntersectionObserver' in window) {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.12 });
        els.forEach(el => observer.observe(el));
    } else {
        els.forEach(el => el.classList.add('visible'));
    }
});

(() => {
    const renderQr = (element) => {
        const value = element.dataset.qrValue || '';
        if (value === '' || typeof window.qrcode !== 'function') {
            element.hidden = true;
            return;
        }

        try {
            const code = window.qrcode(0, 'M');
            code.addData(value, 'Byte');
            code.make();
            element.innerHTML = code.createSvgTag({
                cellSize: 4,
                margin: 4,
                scalable: true,
                title: 'Communication record status',
                alt: 'QR code for the public communication record status',
            });
        } catch (error) {
            element.hidden = true;
        }
    };

    document.querySelectorAll('[data-communication-qr]').forEach(renderQr);
})();

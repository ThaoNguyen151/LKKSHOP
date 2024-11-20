<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer Example</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .content {
            flex: 1;
        }
        .custom-bg-color {
             background-image: linear-gradient(to top, #9795f0 0%, #fbc8d4 100%);
        }
    </style>
    <!-- Include Bootstrap CSS for additional styling if necessary -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Include Font Awesome for icons if necessary -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
    <div class="content">
        
    </div>
    <footer class="custom-bg-color text-center text-white sticky-bottom">
        <!--Grid container-->
        <div class="container p-4">
            <!--Section: Social media-->
            <section class="mb-4">
                <!-- Facebook -->
                <div class="footer_widget">
                    <h3>LKK SHOP</h3>
                    <div class="footer_widget_contect">
                        <p><i class="fa fa-map-marker" aria-hidden="true"></i>  Lô E2a-7, Đường D1, Khu Công nghệ cao, P.Long Thạnh Mỹ, Tp. Thủ Đức, TP.HCM.</p>
                        <p><i class="fa fa-mobile" aria-hidden="true"></i> 0(1234) 567 890</p>
                        <a href="mailto:tpthaonguyen04@gmail.com"><i class="fa fa-envelope" aria-hidden="true"></i> tpthaonguyen04@gmail.com </a>
                    </div>
                </div>
            </section>
            <!--Section: Social media-->
        </div>
        <!--Grid container-->
    </footer>
</body>
</html>

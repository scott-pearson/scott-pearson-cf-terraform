export default {
  async fetch(request) {
    // Get dynamic values for the page
    const currentYear = new Date().getFullYear();

    // The HTML content for the custom challenge interstitial page
    const html = `
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="refresh" content="5">
    <title>Checking your browser - Scott Pearson</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            text-align: center;
        }
        .container {
            background: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 650px;
            width: 100%;
            /* Use a neutral, informative color like blue for challenges */
            border-top: 4px solid #007bff;
        }
        h1 {
            color: #007bff;
            font-size: 2.2em;
            margin-top: 0;
        }
        p {
            font-size: 1.1em;
            line-height: 1.6;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        footer {
            margin-top: 30px;
            font-size: 0.85em;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Verifying your connection...</h1>
        <p>This is a standard security check. Please wait while we ensure your connection is secure.</p>
        <p>Your browser will be redirected shortly.</p>
        <p>::CAPTCHA_BOX::</p>
        <footer>
            <p>This check is performed by Scott Pearson, powered by Cloudflare.</p>
            <p>&copy; ${currentYear} Scott Pearson</p>
        </footer>
    </div>
</body>
</html>
`;

    // Return the custom HTML response. A 403 status is still appropriate.
    return new Response(html, {
      status: 403,
      headers: {
        'Content-Type': 'text/html; charset=utf-8',
      },
    });
  }
};

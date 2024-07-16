const express = require('express');
const jwt = require('jsonwebtoken');

const app = express();
const port = 3000;
const secret = 'roITo2yN5V8W6RbcVJ0GvjKjFbfNgs2DRirmwdpbBTQ48mSudfltuMGxmUCIjYZOIUeBSZqMUcdNRXhYgY8w==';

app.use(express.json());

app.post('/auth', (req, res) => {
    const token = req.headers['authorization'];
    if (!token) {
        return res.status(401).send('Authorization header missing');
    }

    const jwtToken = token.split(' ')[1];
    jwt.verify(jwtToken, secret, { algorithms: ['HS384'] }, (err, decoded) => {
        if (err) {
            return res.status(401).send('JWT verification failed');
        }
        res.status(200).send('OK');
    });
});

app.listen(port, () => {
    console.log(`Auth server listening at http://localhost:${port}`);
});
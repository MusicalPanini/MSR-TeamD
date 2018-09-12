const express = require('express')
const router = express.Router()


module.exports = router

//routes
router.get('/', (req, res) => {
    res.render('index')
})

router.get('/about', (req, res) => {
    res.render('about')
})

router.get('/contact', (req, res) => {
    res.render('contact')
})

router.get('/messageSent', (req, res) => {
    res.render('messageSent', req.query)
})

router.get('/login', (req, res) => {
    res.render('login')
})

router.get('/slideshow', (req, res) => {
    res.render('slideshow', req.query)
})

router.get('/portfolio', (req, res) => {
    res.render('portfolio', req.query)
})

router.get('/privacy', (req, res) => {
    res.render('privacy')
})

router.get('/search', (req, res) => {
    const search = require(__dirname + '/aif-search')
    var params = {
        name: req.query.name || '',
        place: req.query.place || '',
        regNum: req.query.regNum || '',
        battalion: req.query.battalion || ''
    }
    var listings = search.search(params, (err, listings) => {
        res.render('search', { listings: listings, params: params })
    })
})
var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");


router.post("/presenca-hora", function (req, res) {
    medidaController.buscarPresencas(req, res);
});

router.post("/maiores", function(req,res) {
    medidaController.buscarMaior(req, res);
})

router.post("/lotados", function(req, res) {
    medidaController.buscarHorario(req,res);
})
module.exports = router;
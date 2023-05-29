var express = require("express");
var router = express.Router();

var jogadoresController = require("../controllers/jogadoresController");

router.get("/listar", function (req, res) {
    jogadoresController.listar(req, res);
});

router.get("/listarPorTime/:time", function (req, res) {
    jogadoresController.listarPorTime(req, res);
});

router.get("/listarEstatistica/:time", function (req, res) {
    jogadoresController.listarEstatistica(req, res);
});

router.get("/listarTodasStats", function (req, res) {
    jogadoresController.listarTodasStats(req, res);
});

module.exports = router;
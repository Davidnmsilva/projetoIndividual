var express = require("express");
var router = express.Router();

var jogadoresController = require("../controllers/jogadoresController");

router.get("/listar", function (req, res) {
    jogadoresController.listar(req, res);
});

module.exports = router;
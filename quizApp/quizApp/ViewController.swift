//
//  ViewController.swift
//  quizApp
//
//  Created by mac14 on 07/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var praguntaLabel: UILabel!
    @IBOutlet weak var verdaderoButton: UIButton!
    @IBOutlet weak var falsoButton: UIButton!
    @IBOutlet weak var barraProgresoPV: UIProgressView!
    @IBOutlet weak var puntosLabel: UILabel!
    @IBOutlet weak var mensajeLabel: UILabel!
    
    var numPregunta = 0
    var puntaje = 0
    
    let preguntas = [
        Pregunta(texto: "¿Diez mas diez es veinte?", respuesta: "VERDADERO"),
        Pregunta(texto: "¿El ITM es la mejor escuela?", respuesta: "VERDADERO"),
        Pregunta(texto: "¿El America es el peor equipo de Mexico?", respuesta: "VERDADERO"),
        Pregunta(texto: "¿Ecuador se encuentra en NorteAmerica?", respuesta: "FALSO"),
        Pregunta(texto: "¿Las Piñas son Azules?", respuesta: "FALSO"),
        Pregunta(texto: "¿Existe la gravedad?", respuesta: "VERDADERO"),
        Pregunta(texto: "¿Los humanos tienen 2 cabezas?", respuesta: "FALSO"),
        Pregunta(texto: "¿Godzilla es real?", respuesta: "FALSO"),
        Pregunta(texto: "¿La tierra es redonda?", respuesta: "VERDADERO"),
        Pregunta(texto: "¿La capital de Michoacan es Morelia?", respuesta: "VERDADERO")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cambiarPregunta()
    }

    @IBAction func respuestaBtn(_ sender: UIButton) {
                
        let respuestaUsuario = sender.currentTitle // Identifica que boton presiono
        let respuestaCorrecta = preguntas[numPregunta].respuesta //identificar la respuesta F o V
        
        
        
        if respuestaUsuario == respuestaCorrecta {
            mensajeLabel.text = "Respuesta Correcta. Bien Hecho"
            sender.backgroundColor = UIColor.green
            puntaje += 1
            puntosLabel.text = "Puntos:\(puntaje * 10)"
        } else {
            mensajeLabel.text = "Respuesta Incorrecta. Terrible :("
            sender.backgroundColor = UIColor.red
        }
        
        //Cambio de pregunta
        if numPregunta + 1 < preguntas.count {
            numPregunta += 1
        } else{
            //alerta
            let alerta = UIAlertController(title: "Felicidades", message: "Tu puntuaje es: \(puntaje * 10) Puntachos", preferredStyle: .alert)
            
            //variables para el mensaje de la alerta de jugar nuevo o salir
            let salirJuego = UIAlertAction(title: "salir", style: .cancel){ _ in exit(0)}
            let JugarNuevo = UIAlertAction(title:"jugar de nuevo", style: .default){_ in self.reset()}
            
            //accion que ejecuta el mensaje
            alerta.addAction(JugarNuevo)
            alerta.addAction(salirJuego)
            present(alerta, animated: true, completion: nil)
        }
        
        //Timer que se ejecuta para el intervalo de tiempo que dura en cambiar la pregunta
        Timer.scheduledTimer(timeInterval: 0.8, target: self, selector:
                #selector(cambiarPregunta), userInfo: nil, repeats: false)
    }
    
    
    
    @objc func cambiarPregunta() {
        praguntaLabel.text = preguntas[numPregunta].texto
        verdaderoButton.backgroundColor = UIColor.white
        falsoButton.backgroundColor = UIColor.white
        barraProgresoPV.progress = Float(numPregunta + 1)/Float(preguntas.count)
        mensajeLabel.text = "  "
        
    }
    
    func reset(){
            
            numPregunta = 0
            puntaje = 0
            praguntaLabel.text = preguntas[numPregunta].texto
            puntosLabel.text = "Puntos:\(puntaje * 10)"
        }

}


//
//  matchVC.swift
//  tinder_clone
//
//  Created by Felipe on 07/09/21.
//

import UIKit

class MatchVC: UIViewController {
    
    var usuario: Usuario? {
        didSet{
            if let usuario = usuario {
                fotoImageView.image = UIImage(named: usuario.foto)
                mensagemLabel.text = "\(usuario.nome) curtiu você também! "
            }
        }
    }
    let fotoImageView: UIImageView = .fotoImageView(named: "pessoa-1")
    let likeImageView: UIImageView = .fotoImageView(named: "icone-like")
    let mensagemLabel: UILabel = .textBolLabel(18, textColor: .white, numberOfLines: 1)
    
    let mensagemTxt: UITextField = {
        let textField = UITextField()
       
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.placeholder = "diga algol legal"
        textField.backgroundColor =  .white
        textField.layer.cornerRadius = 8
        textField.textColor = .darkText
        textField.returnKeyType = .go
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 0))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let mensagemEnviaButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Enviar", for: .normal)
        button.setTitleColor(UIColor(red: 62/255, green: 163/255, blue: 255/255, alpha: 1), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return button
    }()
    
    let voltarButton: UIButton = {

        let button = UIButton()
        button.setTitle("Voltar para o tinder", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button

        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        view.addSubview(fotoImageView)
        fotoImageView.preencherSuperview()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor]
        
        fotoImageView.layer.addSublayer(gradient)
        
        
        mensagemLabel.textAlignment = .center
        
        voltarButton.addTarget(self, action: #selector(voltarClique), for: .touchUpInside)
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        likeImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        likeImageView.contentMode = .scaleAspectFit
        
        mensagemTxt.addSubview(mensagemEnviaButton)
        mensagemEnviaButton.preencher(
            top: mensagemTxt.topAnchor,
            leading: nil,
            trailing: mensagemTxt.trailingAnchor,
            bottom: mensagemTxt.bottomAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 16)
        )
        
        let stackView = UIStackView(arrangedSubviews: [likeImageView, mensagemLabel, mensagemTxt, voltarButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.preencher(
            top: nil,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            padding: .init(top: 0, left: 32, bottom: 46, right: 32)
        )
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func voltarClique() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func keyBoardShow (notification: NSNotification){
        if let keyboardSyze = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if let duracao = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
             
                UIView.animate(withDuration: duracao) {
                    self.view.frame = CGRect(
                        x: self.view.frame.origin.x,
                        y: self.view.frame.origin.y,
                        width: self.view.frame.width,
                        height: self.view.frame.height - keyboardSyze.height
                    )
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    @objc func keyboardHide (notification: NSNotification){
        if let duracao = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
         
            UIView.animate(withDuration: duracao) {
                self.view.frame = UIScreen.main.bounds
                self.view.layoutIfNeeded()
        }
        
        }
    }
}

import Publish
import Plot

extension Page {
    
    static var tocPage: Self {
        return Page(path: "TheOtherContacts", content: generateContent())
    }
    
    fileprivate static func generateContent() -> Content {
        
        let faqs: [(pregunta: String, respuesta: String)] = [
            (pregunta: "¿Están mis contactos almacenados de forma segura?", respuesta: "¡POR SUPUESTO! Los contactos que almacenas en T.O.C. quedan almacenados de forma local para que los puedas consultar si no tienes conexión a internet. La sincronización con el resto de dispositivos se hace a través de iCloud, por lo que no tenemos acceso a tus datos en ningun momento."),
            (pregunta: "¿Cómo funciona la identificación de llamadas?", respuesta: "La identificación de llamadas utiliza el framework \"CallKit\" que Apple proporciona a los desarrolladores. Utiliza la copia local de tus contactos para transferirlos a la extensión de forma segura y que cuando ese número de teléfono te llame puedas saber quién es. Para activar la identificación de llamadas, debes ir a \"Ajustes\" > \"Teléfono\" > \"Bloqueo e ID de llamdas\" y activar \"T.O.C.\"."),
            (pregunta: "¿Si actualizo a la versión 3 perderé mis datos?", respuesta: "No, aunque debido al cambio en el sistema de sincronización de los datos el proceso de migración no se realiza automáticamente. Debes abrir la versión 2, exportar los datos que tenías a través de la sección de Ajustes y finalmente importarlos en la nueva versión. No te preocupes porque es un proceso muy sencillo y viene explicado con detalle cuando abres por primera vez la v3."),
            (pregunta: "¿En qué se diferencia la versión 3 de la anterior versión?", respuesta: "En T.O.C. 3 nos hemos esforzado al máximo en optimizar todo y mejorar el rendimiento lo máximo posible. Es por ello que esta versión llega como una nueva app a la App Store. En The Other Contacts 3 utilizamos un nuevo sistema de sincronización de los datos para que todo funcione a la parfección, y es por ello que requiere iOS 13 o posterior. Además, hemos hecho una serie de cambios visuales para adaptarnos al modo oscuro de iOS 13, utilización de símbolos del sistema para que la aplicación ocupe menos espacio en tu dispositivo, y mucho más...")
        ]
        
        var content = Content()
        content.title = "The Other Contacts"
        content.description = "Almacena tus otros contactos"
        let pageBody: Node<HTML.BodyContext> =
            .div(
                .header(
                    .nav(
                        .img(.id("logo"), .src("img/logo.png"))
                    )
                ),
                .section(
                    .class("featured"),
                    .h1(.id("TOC_h1"), "The Other Contacts"),
                    .p(.class("center"), "La nueva forma de almacenar contactos en tu dispositivo iOS"),
                    .button(
                        .class("center"),
                        .a(.href("https://apps.apple.com/es/app/the-other-contacts-3-toc/id1469210529"), "Descargar")
                    ),
                    .br(),
                    .img(.class("center"), .src("img/header-img.png"))
                ),
                .section(
                    .h2(.id("faq_h2"), "Preguntas frecuentes"),
                    .forEach(faqs) { faq in
                        .div(
                            .h4(.text(faq.pregunta)),
                            .p(.class("faq_answer"), .text(faq.respuesta))
                        )
                    }
                ),
                .section(
                    .class("featured"),
                    .h1("¡Descarga The Other Contacts!"),
                    .p(.class("center"), "Descarga la agenda alternativa para tu dispostivo iOS con la que podrás mantener la privacidad y diferenciar a los contactos de tu ámbito más cercano."),
                    .button(
                        .class("center"),
                        .a(.href("https://apps.apple.com/es/app/the-other-contacts-3-toc/id1469210529"), " Disponible en App Store")
                    )
                )
            )
        content.body = Content.Body(node: pageBody)
        return content
    }
    
}

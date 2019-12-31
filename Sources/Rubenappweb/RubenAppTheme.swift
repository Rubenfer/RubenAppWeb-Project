import Publish
import Plot

extension Theme where Site == RubenAppWeb {
    
    static var rubenAppWeb: Self {
        Theme(htmlFactory: RubenAppHTMLFactory())
    }
    
}

private struct RubenAppHTMLFactory: HTMLFactory {
    
    private struct App {
        let nombre: String
        let subtitulo: String
        let descripcion: String
        let imagen: URLRepresentable
        let enlaceDescarga: URLRepresentable
        let enlaceInfo: URLRepresentable?
    }
    
    private let appsIndex: [App] = [
        App(nombre: "The Other Contacts",
            subtitulo: "Almacena \"tus otros contactos\"",
            descripcion: "Con The Other Contacts podrás almacenar los contactos no personales que necesites tener guardados. Separa de la agenda principal de tu teléfono los contactos que no quieres que vean tus historias de WhatsApp, ni te salgan en las sugerencias de amigos en diferentes redes sociales.",
            imagen: "img/TOC.png",
            enlaceDescarga: "https://apps.apple.com/es/app/the-other-contacts-3-toc/id1469210529",
            enlaceInfo: "https://ruben.app/TheOtherContacts"),
        
        App(nombre: "InfoDGT",
            subtitulo: "Información a tiempo real sobre el estado de las carreteras españolas",
            descripcion: "Dispón directamente en la palma de tu mano la información a tiempo real sobre el estado de la red de carreteras españolas. Incidencias, cámaras, sensores meteorológicos, radares, e información sobre los precios en todas las gasolineras españolas.",
            imagen: "img/InfoDGT.png",
            enlaceDescarga: "https://apps.apple.com/es/app/infodgt/id1353122720",
            enlaceInfo: nil),
        
        App(nombre: "Semana Santa Valladolid",
            subtitulo: "Información detallada sobre la Semana Santa de Valladolid",
            descripcion: "Toda la información sobre la Semana Santa de Valladolid, una de las mejores de España. Procesiones por días, datos sobre las cofradías, incidencias en el tráfico de la ciudad, y mucho más...",
            imagen: "img/SSVLL.png",
            enlaceDescarga: "https://apps.apple.com/es/app/semana-santa-valladolid/id1303047750",
            enlaceInfo: "https://github.com/Rubenfer/Semana-Santa-Valladolid")
    ]
    
    func makeSectionHTML(for section: Section<RubenAppWeb>, context: PublishingContext<RubenAppWeb>) throws -> HTML {
        HTML()
    }
    
    func makeItemHTML(for item: Item<RubenAppWeb>, context: PublishingContext<RubenAppWeb>) throws -> HTML {
        HTML()
    }
    
    func makePageHTML(for page: Page, context: PublishingContext<RubenAppWeb>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site, stylesheetPaths: [Path("\(page.path)/styles.css")], rssFeedPath: nil),
            .body(
                page.body.node,
                .footer(
                    .p(
                        .text("Página creada utilizando Swift. 100% libre de JavaScript.")
                    ),
                    .p(
                        .text("Copyright © 2019. Rubén Fernández")
                    )
                )
            )
        )
    }
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<RubenAppWeb>) throws -> HTML? { nil }
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<RubenAppWeb>) throws -> HTML? { nil }
    
    func makeIndexHTML(for index: Index, context: PublishingContext<RubenAppWeb>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site, rssFeedPath: nil),
            .body(
                .header(
                    .id("header-div"),
                    .nav(
                        .ul(
                            .li(.a(.href("/"), "HOME")),
                            .li(.a(.href("mailto:contacto@ruben.app"), "Contacto"))
                        )
                    ),
                    .div(
                        .class("main-section"),
                        .div(
                            .id("main-text-div"),
                            .h1("DESCUBRE LAS ",.span("APLICACIONES")," PARA IOS"),
                            .a(
                                .class("btn"),
                                .id("main-button"),
                                .href("https://apps.apple.com/es/developer/ruben-fernandez/id1013021034"),
                                .target(.blank),
                                "Apps disponible en App Store"
                            )
                        ),
                        .div(
                            .id("main-img-div"),
                            .img(
                                .id("img-icons"),
                                .src("img/apps-header.png")
                            )
                        )
                    )
                ),
                .forEach(appsIndex) { app in
                    .section(
                        .class("featured-app"),
                        .img(.src(app.imagen)),
                        .div(
                            .h2(.text(app.nombre)),
                            .h4(.text(app.subtitulo)),
                            .p(.text(app.descripcion)),
                            .unwrap(app.enlaceInfo) {
                                .a(
                                    .class("btn more-info-btn"),
                                    .href($0), .target(.blank),
                                    "Más información"
                                )
                            },
                            .a(
                                .class("btn download-btn"),
                                .href(app.enlaceDescarga), .target(.blank),
                                "Descargar \(app.nombre)"
                            )
                        )
                    )
                },
                .footer(
                    .p(
                        .text("Página creada utilizando Swift. 100% libre de JavaScript.")
                    ),
                    .p(
                        .text("Copyright © 2019. Rubén Fernández")
                    )
                )
            )
        )
    }
    
}

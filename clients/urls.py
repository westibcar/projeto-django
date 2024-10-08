from django.urls import path, include
from .views import index  # Importe a view corretamente
from rest_framework.routers import DefaultRouter
from .views import ClienteViewSet
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', index, name='index'),  # Rota para a página inicial da aplicação clients
]

# Configurando o roteador para as views da API
router = DefaultRouter()
router.register(r'clientes', ClienteViewSet)  # Isso mapeia a URL /api/clientes/ para o ClienteViewSet

urlpatterns = [
    path('api/', include(router.urls)),  # Inclui as rotas da API sob o prefixo /api/
    path('', index, name='index'),  # Mapeia a rota raiz para a página inicial
]

if settings.DEBUG:
    urlpatterns += static(
        settings.MEDIA_URL,
        document_root=settings.MEDIA_ROOT
    )
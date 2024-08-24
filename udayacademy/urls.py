from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),  # Rota para o painel de administração do Django
    path('', include('clients.urls')),  # Inclui as URLs da aplicação 'clients'
]
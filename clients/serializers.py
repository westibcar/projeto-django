from rest_framework import serializers
from .models import Cliente  # Importar o modelo Cliente

class ClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cliente
        fields = '__all__'
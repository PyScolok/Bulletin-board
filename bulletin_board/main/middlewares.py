from .models import SubRubric

def bb_context_processor(request):
    context = {}
    context['rubrics'] = SubRubric.objects.all()
    return context